#!/bin/bash

# brew install maven
# brew install swagger-codegen
# Le Config
formats=(php)
projects=(listenapi)

# Le Action
for project in "${projects[@]}"
do
    for format in "${formats[@]}"
    do
        mkdir -p dist/${format}
        mkdir -p dist/${format}/${project}
        java -jar swagger-codegen-v2.jar generate \
                    -Dmodels -Dapis  \
                    -t src/templates/${format} \
                    -i src/projects/${project}.yaml \
                    -l ${format} \
                    -o dist/${format}/${project}
    done
done