### same as launch24 --> except we use env variable - to specify workers/instances


### force remove --> removes even running containers
docker rm -f node23_lb_01
docker rm -f node23_lb_02
docker rm -f node23_lb_03
docker rm -f node23_lb_04
###################################################

BASE_PORT=18880
NODES="${1:- 4}"             ### if nodes not specified, by default 4 is taken       :-  means substitution
# echo $NODES
for x in $(seq 1 "${NODES}");do
    echo $x "node23_lb_0${x}" `expr $BASE_PORT + $x`
    docker run -d --name "node23_lb_0${x}" -p `expr $BASE_PORT + $x`:3055 "node23_lb" 
done

### HOW TO RUN      ===> bash bash23/launch25.sh 3      // starts 3 containers
