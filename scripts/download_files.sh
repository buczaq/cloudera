curl -o oscars.csv https://raw.githubusercontent.com/buczaq/cloudera/master/static_datasets/oscars.csv > /dev/null
echo "$(date) oscars.csv has been downloaded" >> download_files.log

curl -o wiki_movie_plots.csv https://raw.githubusercontent.com/buczaq/cloudera/master/static_datasets/wiki_movie_plots.csv > /dev/null
echo "$(date) wiki_movie_plots.csv has been downloaded" >> download_files.log

curl -o actors_genders.csv https://raw.githubusercontent.com/buczaq/cloudera/master/static_datasets/actors_genders.csv > /dev/null
echo "$(date) actors_genders.csv has been downloaded" >> download_files.log

