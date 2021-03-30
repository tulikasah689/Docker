node {

    checkout scm

    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {

        def customImage = docker.build("tulikasah689/our-web-app")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
