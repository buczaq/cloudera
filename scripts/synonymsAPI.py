import requests
import sys
import json
import os
import logging
 
logging.basicConfig(filename='synonymsAPI.log', format='%(asctime)s - %(message)s', level=logging.INFO)
 
inputWord = sys.argv[1]
inputMax = sys.argv[2]
synonyms = {}
path = "synonyms.json"
 
def synonyms_get(word, max):
    headers = {
    'X-RapidAPI-Key': 'bf02cdb9a7msh5aaaa5372b0f9b2p134436jsn29de29f01fbe'
    }
    parameters = {
        "ml": word,
        "max": max
    }
    try:
        response = requests.get('https://api.datamuse.com/words', params=parameters)
    except requests.exceptions.RequestException as e:
        logging.error("Exception occurred", exc_info=True)
        print(e)
        sys.exit(1)
 
    if response.json():
        logging.info('Got data from API for word: '+ word)
        data = response.json()
        for element in data:
            del element['tags']
        #print(data)
        return data
 
    else:
        print("Word not found in API!")
        logging.error(f"Word {word} not found")
        return response.json()
 
def readJSON(path):
    global synonyms
    if os.path.exists('synonyms.json'):
        with open(path, 'r') as json_file:
            try:
                data = json.load(json_file)
                #print(data)
                synonyms = data
                return data
            except Exception as e:
                logging.error("Exception occurred", exc_info=False)
                print("error %s on readJSON()" % e)
    else:
        with open(path, 'w') as json_file:
            try:
                data = synonyms_get('nice', 5)
                synonym = {'nice': data}
                json.dump(synonym, json_file)
                synonyms = synonym
                return synonym
            except Exception as e:
                logging.error("Exception occurred", exc_info=False)
                print("error %s on readJSON()" % e)
 
def saveToJSON(data, path):
    global synonyms
    with open(path, 'w') as json_file:
        try:
            synonym = {inputWord: data}
            synonyms.update(synonym)
            json.dump(synonyms, json_file)
        except Exception as e:
            logging.error("Exception occurred", exc_info=False)
            print("error %s on saveToJSON" % e)
 
def main(filePath, word):
    global synonyms, inputWord, inputMax
    readJSON(filePath)
    if word in synonyms:
        logging.info("Word: " + word + " already saved, file did not change")
        print("Word: " + word + " already saved, file did not change")
    else:
        logging.info("Word: " + word + " not found, getting data from API")
        print("Word: " + word + " not found, getting data from API")
        saveToJSON(synonyms_get(inputWord, inputMax), filePath)
        os.system("su -c \"hdfs dfs -put synonyms.json /user/hadoop/HDFS/raw_data/synonyms\" hdfs")
 
main(path, inputWord)
