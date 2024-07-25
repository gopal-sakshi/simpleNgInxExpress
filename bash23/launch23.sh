### bash script to stop & remove containers with node23_lb image ---> needs some work...
cleanup23() {
    docker inspect "$1" &> /dev/null
    if [ "$?" != 0 ]; then
        return 0
    fi
    echo "find container with node23_lb image"
    
    cont_ids_running=$(docker ps -a -q --filter ancestor="$1" --filter status=running)
    echo "status ==>" "$?" "$cont_ids_running"
    if [ "$?" != 0 ]; then
        echo "contIds ====> ${cont_ids_running}"
        # docker stop $cont_ids_running
        # docker rm $cont_ids_running
    else
        echo "interesint"
    fi
    # echo "whats happening"
    # cont_ids_stopped=$(docker ps -a -q --filter ancestor="$1" --filter status=exited)
    # if [ "$?" != 0 ]; then
    #     echo "contIds stopped ====> " $cont_ids_stopped
    #     docker rm $cont_ids_stopped
    # fi
}

cleanup23 "node23_lb"

# docker run -d --name "node23_lb_01" -p 18881:3055 "node23_lb" 
# docker run -d --name "node23_lb_02" -p 18882:3055 "node23_lb" 
# docker run -d --name "node23_lb_03" -p 18883:3055 "node23_lb" 