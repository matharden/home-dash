A dashboard for home.

## Set-up

Create a `local.sh` file with there variables:

```shell
#!/bin/bash
 
export AUTH_TOKEN="add_token_here"
# Weather
export WOEID="add_code_here"
# Trello
export TRELLO_DEVELOPER_KEY="add_key_here"
export TRELLO_MEMBER_TOKEN="add_token_here"
export TRELLO_BOARD_ID="add_board_here"
 
dashing start
```

And make it executable:

```shell
chmod +x local.sh
```

Get dependancies:

```shell
bundle install
```

## Run the dashboard

```shell
make
```

Check out http://shopify.github.com/dashing for more information.
