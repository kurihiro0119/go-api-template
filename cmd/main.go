package main

import (
	"fmt"
	"flag"
	
	"example.com/myproject/configs"
)

func main() {
	flag.Parse()

	env := flag.Arg(0)
	config := configs.NewConfig(env)

	fmt.Println(config.Env)
	fmt.Println("Hello, 世界")

}
