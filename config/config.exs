# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :onemorebot,
  token: System.get_env("CC_SLACK_TOKEN")
