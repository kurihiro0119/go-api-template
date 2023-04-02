package configs

import (
	"fmt"
	"os"
	"github.com/BurntSushi/toml"
)

type Config struct {
	Env string `toml:"env"`
}

func NewConfig(env string) *Config {
	confPath := fmt.Sprintf("%s/configs/enviroment/%s.toml", os.Getenv("APP_ROOT"), env)
	config := Config{}
	_, err := toml.DecodeFile(confPath, &config)
	if err != nil {
		panic(err)
	}

	return &Config{Env: env}
}