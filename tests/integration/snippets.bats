#!/usr/bin/env bats

setup() {
    rm ~/.serverauditor.storage || true
}

@test "snippets help by arg" {
    run serverauditor snippets --help
    [ "$status" -eq 0 ]
}

@test "snippets help command" {
    run serverauditor help snippets
    [ "$status" -eq 0 ]
}

@test "List snippets in table format" {
    serverauditor snippet -L test --script 'ls'
    run serverauditor snippets
    [ "$status" -eq 0 ]
    ! [ -z $(cat ~/.serverauditor.storage) ]
}
