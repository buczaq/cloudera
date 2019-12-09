hdfs dfs -chmod 777 /user
 
hdfs dfs -mkdir /user/hadoop
 
hdfs dfs -mkdir /user/hadoop/HDFS
 
hdfs dfs -mkdir /user/hadoop/HDFS/raw_data
 
hdfs dfs -mkdir /user/hadoop/HDFS/raw_data/films_plots
hdfs dfs -mkdir /user/hadoop/HDFS/raw_data/oscars
hdfs dfs -mkdir /user/hadoop/HDFS/raw_data/actors_genders
hdfs dfs -mkdir /user/hadoop/HDFS/raw_data/synonyms
 
hdfs dfs -put /home/cloudera/Downloads/database.csv /user/hadoop/HDFS/raw_data/oscars/oscars.csv
 
hdfs dfs -put wiki_movie_plots.csv /user/hadoop/HDFS/raw_data/films_plots/films_plots.csv
 
hdfs dfs -put actors_genders.csv /user/hadoop/HDFS/raw_data/actors_genders/actors_genders.csv
 
hdfs dfs -mkdir /user/hadoop/HDFS/MiddleSet
hdfs dfs -mkdir /user/hadoop/HDFS/ResultSet
 
COUNTER=$(hdfs dfs -ls -R /user/hadoop/HDFS | wc -l)
 
if [[ $COUNTER -ne 10 ]]
then
    echo "Something is wrong with the files/directories structure!"
    echo "should be: 10 items"
    echo "is: $COUNTER items"
fi
