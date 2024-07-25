### force remove --> removes even running containers
docker rm -f node23_lb_01
docker rm -f node23_lb_02
docker rm -f node23_lb_03

### start 3 new containers
docker run -d --name "node23_lb_01" -p 18881:3055 "node23_lb" 
docker run -d --name "node23_lb_02" -p 18882:3055 "node23_lb" 
docker run -d --name "node23_lb_03" -p 18883:3055 "node23_lb" 