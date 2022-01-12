# How to Set Up the Protobuf Compiler for Java on OSX

Install the protobuf compiler from here: https://github.com/protocolbuffers/protobuf/releases.  Do not get the language specific package, get the platform specific package, for example, https://github.com/protocolbuffers/protobuf/releases/download/v3.17.3/protoc-3.17.3-osx-x86_64.zip.

Execute it once while holding down the "Option" key so you can tell MacOs to trust it.

Obtain the grpc java plugin to the protoc compiler here: https://repo1.maven.org/maven2/io/grpc/protoc-gen-grpc-java/1.38.1/ . Rename the download to `protoc-gen-grpc-java`, make it executable, and put it in the same directory as protoc.

Execute it once while holding down the "Option" key so you can tell MacOs to trust it.

Example usage for generating gRPC artifacts.  Make sure that the directory containing `protoc` is on the path.
```bash
protoc --java_out=myproject/src/main/java \
       --grpc-java_out=myproject/src/main/java \
       myservice.proto
```