#### node23_lb  ===> load balancer

DOCKER_IMG23="node23_lb"
docker build -t "${DOCKER_IMG23}" .
if [ "$?" == 0 ]; then
    echo "image build success23"
else 
    echo "adi pedda phattu"
    exit 1
fi