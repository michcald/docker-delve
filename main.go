package main

import "fmt"

type Person struct {
	Name string
	Age uint
}

func main() {
	p := Person{
		Name: "matt",
		Age:  33,
	}

	for i:=0; i<100; i++ {
		p.Age ++

		fmt.Printf("%v", p)
	}
}
