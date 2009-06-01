# require a modern perl
use 5.8.2;

# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# Define metadata
name 'Task-Kensho';
all_from 'lib/KiokuX/Layer8.pm';

requires 'KiokuX::Model';
requires 'KiokuX::User';

auto_set_repository;
auto_manifest;
auto_install;
WriteAll;
