## Table of Contents
* [Introduction](#Introduction)
* [Getting Started](#getting-started)
* [Usage](#usage)
* [Loading Seed Data](#loading-seed-data)
* [Contributors](#contributors)
* [License](#license)
* [Changelog](#changelog)

## Introduction

I created an animal shelter website program that is a website that is used to adopt animals. It's inception was inspired by the process of adopting my dog Mako. This program allows users to look at pictures of the available pets for adoption. If interested they can create an account and adopt the pet. Once they have adopted the pet they can add pictures they take of the pet, and change\update the pet's profile.

## Getting Started
To get started the database must be loaded by using the rake task `rake db:migrate`. This program includes a command line interface aspect which runs during the first time accessing the website. When trying to acceess the website check the console and you will see prompts requesting an admin username and password; then prompts for the number of words, and number of characters used in the salt for pictures. 

## Usage
Once started, you can log in normally as the admin to add pets to be adopted. Once pets have been added, the pet's owner (in this instance the admin) can add/edit/delete picture's in the pet's photo album. You cannot view the pet's profiles without having an account. You can only view your own pets, or pets available for adoption. If you try to view other pet's who have a different owner you will be denied access. Users can delete their own account and any pets associated with them will be put back for adoption. Each pet gets their own profile page with a profile picture, and photo album. Each photo gets their own detailed page.

## Loading Seed Data
For demonstration purposes, there is an included SeedData.tar.xz that contains the files used for creating seed data. Extract the tar by your GUI, or the terminal commands ```tar -xf SeedData.tar.xz```. Load the seed data by using the command ```rake db:seed``` this will load dummy data for demoing purposes. You are still required to make an admin username and password, and set up the environmental variables

## Contributors
If you would like to contribute fork the github repo, create your feature branch, commit changes and push the branch.

## License
(c) 2020 Vladimir Jimenez, all rights reserved. For Online Software Engineering PT - Sinatra MVC Project

## Changelog
Version 1.1 (7/28/2020) Additional info and fixes on seed data, readme updated to reflect seed data usage

Version 1.0 (7/27/2020) Initial Release
