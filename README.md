# replace-env-vars
Bash script that replaces placeholders starting from specific string taking input from source file and writes it to destination file

### Usage 
`./replace-env-vars.sh ./config.example.json ./config.json PLACEHOLDERS_START_STRING`


## Example

### config.example.json

```
{
    "apiKey":"MY_COOL_APP_API_KEY",
    "apiUrl: "MY_COOL_APP_API_URL"
}
```

usually config files aren't mark to not tracked by vcs. so there might be no `config.json` so we will make one from script. 

### in teminal 
`./replace-env-vars.sh ./config.example.json ./config.json MY_COOL_APP`

if `MY_COOL_APP_API_KEY` & `MY_COOL_APP_API_URL` are defined in environment as `fsafjkwnefknafd` & `https://api.coolapp.com` respctively then `config.json` will look like this



### config.json

```
{
    "apiKey":"fsafjkwnefknafd",
    "apiUrl: "https://api.coolapp.com"
}
```
