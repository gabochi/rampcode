cat $1/8080 | tr '\n' ' ' | sed -f replace.sed | pdsend 8080
cat $1/8081 | tr '\n' ' ' | sed -f replace.sed | pdsend 8081
cat $1/8082 | tr '\n' ' ' | sed -f replace.sed | pdsend 8082
cat $1/8083 | tr '\n' ' ' | sed -f replace.sed | pdsend 8083
