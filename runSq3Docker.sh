

modelDirName="SqueezeSegV3"
modelsBaseDir="/home/Documents"
modelDir="$modelsBaseDir/$modelDirName"
dataDirRoot="/home/Documents/data/tmp/dataset"
dataDir="/home/Documents/data/tmp/dataset/sequences/00/velodyne"
predDir="/home/Documents/data/out"

container="squeezesegv3"
image=$container"_image"

    
modelRunCommand="python3 demo.py" 
modelRunCommand+=" --dataset $dataDirRoot"
modelRunCommand+=" --log $predDir"
modelRunCommand+=" --model /home/Documents/SqueezeSegV3/SSGV3-53"

modelRunDir="$modelDir/src/tasks/semantic"


# Run
# container name
# Access to GPUs
# User (otherwise we won't have permission to modify files created by bind mount)
# Mount model dir
# Mount data (bins) dir
# Mount predictions (bins) dir
# image
# bash (command) 


echo 
echo $modelRunCommand
echo 
echo Running Docker $container, $image 
echo 

docker run \
--name $container \
--gpus all \
--user "$(id -u)" \
--ipc=host \
--mount type=bind,source="$modelDir",target="$modelDir" \
--mount type=bind,source="$dataDir",target="$dataDir" \
--mount type=bind,source="$predDir",target="$predDir" \
$image \
bash -c "cd $modelRunDir && $modelRunCommand"



# Clean up container
docker container stop $container && docker container rm $container




