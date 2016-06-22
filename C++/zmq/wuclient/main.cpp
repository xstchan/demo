//
//  Weather update client in C++
//  Connects SUB socket to tcp://localhost:5556
//  Collects weather updates and finds avg temp in zipcode
//
//  Olivier Chamoux <olivier.chamoux@fr.thalesgroup.com>
//
#include <zmq.hpp>
#include <iostream>
#include <sstream>

int main (int argc, char *argv[])
{

    int major, minor, patch;
    zmq_version (&major, &minor, &patch);
    std::cout << "当前ZMQ版本号为" << major << "." << minor << "." << patch << std::endl;

    zmq::context_t context (1);

    //  Socket to talk to server
    std::cout << "Collecting updates from weather server...\n" << std::endl;
    zmq::socket_t subscriber (context, ZMQ_SUB);
    subscriber.connect("tcp://localhost:5556");

    //  Subscribe to zipcode, default is NYC, 10001
	const char *filter = (argc > 1)? argv [1]: "10001";
    subscriber.setsockopt(ZMQ_SUBSCRIBE, filter, strlen (filter));


    //  Process 100 updates
    while(true) {

        int zipcode = 0; 
        int temperature = 0;

        zmq::message_t update;
        subscriber.recv(&update);

        std::istringstream iss(static_cast<char*>(update.data()));
		iss >> zipcode >> temperature;

        std::cout   << "Temperature for zipcode '"<< filter
                    <<"' was "<<(int) (temperature) <<"F"
                    << std::endl;
    }
    return 0;
}
