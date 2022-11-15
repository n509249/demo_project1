for file in ./data/$1/*.json
do
  aws dynamodb batch-write-item --request-items file://$file
done
