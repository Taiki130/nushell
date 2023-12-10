#!/usr/bin/env nu --stdin

# ex) "key1=value2\nkey2=value2\nkey3=value3" | ./parse_key_value_json.nu to-json
def "main to-json" [] {
    $in | lines | parse '{key}={value}' | to json
}

# ex) '[{"key": "key1", "value": "value1"}, {"key": "key2", "value": "value2"}]' | ./parse_key_value_json.nu from-json
def "main from-json" [] {
    $in | from json | each {|i| $"($i.key)=($i.value)"} | str join '\n'
}

def main [] {}
