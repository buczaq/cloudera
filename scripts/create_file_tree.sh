LOG_FILE="create_file_tree.log"

su -c "hdfs dfs -chmod 777 /user" hdfs

su -c "hdfs dfs -mkdir /user/hadoop"
echo "$(date) Created /user/hadoop directory" >> $LOG_FILE
 
su -c "hdfs dfs -mkdir /user/hadoop/HDFS" hdfs
echo "$(date) Created /user/hadoop/HDFS directory" >> $LOG_FILE

su -c "hdfs dfs -mkdir /user/hadoop/HDFS/raw_data" hdfs
echo "$(date) Created /user/hadoop/HDFS/raw_data directory" >> $LOG_FILE
 
su -c "hdfs dfs -mkdir /user/hadoop/HDFS/raw_data/movie_plots" hdfs
echo "$(date) Created /user/hadoop/HDFS/raw_data/movie_plots directory" >> $LOG_FILE
su -c "hdfs dfs -mkdir /user/hadoop/HDFS/raw_data/oscars" hdfs
echo "$(date) Created /user/hadoop/HDFS/raw_data/oscars directory" >> $LOG_FILE
su -c "hdfs dfs -mkdir /user/hadoop/HDFS/raw_data/actors_genders" hdfs
echo "$(date) Created /user/hadoop/HDFS/raw_data/actors_genders directory" >> $LOG_FILE
su -c "hdfs dfs -mkdir /user/hadoop/HDFS/raw_data/synonyms" hdfs
echo "$(date) Created /user/hadoop/HDFS/raw_data/synonyms directory" >> $LOG_FILE
 
su -c "hdfs dfs -put /home/cloudera/Downloads/database.csv /user/hadoop/HDFS/raw_data/oscars/oscars.csv" hdfs
echo "$(date) Created /user/hadoop/HDFS/raw_data/oscars/oscars.csv" >> $LOG_FILE
 
su -c "hdfs dfs -put wiki_movie_plots.csv /user/hadoop/HDFS/raw_data/movie_plots/movie_plots.csv" hdfs
echo "$(date) Created hadoop/HDFS/raw_data/movie_plots/movie_plots.csv" >> $LOG_FILE > echo

su -c "hdfs dfs -put actors_genders.csv /user/hadoop/HDFS/raw_data/actors_genders/actors_genders.csv" hdfs
echo "$(date) Created /user/hadoop/HDFS/raw_data/actors_genders/actors_genders.csv" >> $LOG_FILE 

su -c "hdfs dfs -mkdir /user/hadoop/HDFS/MiddleSet" hdfs
echo "$(date) Created /user/hadoop/HDFS/MiddleSet" >> $LOG_FILE
 
su -c "hdfs dfs -mkdir /user/hadoop/HDFS/ResultSet" hdfs
echo "$(date) Created /user/hadoop/HDFS/ResultSet" >> $LOG_FILE
 
COUNTER=$(su -c "hdfs dfs -ls -R /user/hadoop/HDFS | wc -l" hdfs)
 
if [[ $COUNTER -ne 10 ]]
then
    echo "Something is wrong with the files/directories structure!"
    echo "should be: 10 items"
    echo "is: $COUNTER items"
fi

