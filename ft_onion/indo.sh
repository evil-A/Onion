#!/usr/bin/env zsh

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    indo.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: evila-ro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/26 13:59:36 by evila-ro          #+#    #+#              #
#    Updated: 2023/04/26 14:03:57 by evila-ro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Colors
blue=$'\033[0;34m'
cyan=$'\033[1;96m'
reset=$'\033[0;39m'


echo "${cyan}Docker${blue} is cleaning the system of containers!${reset}"
docker system prune -af

echo "${cyan}Docker${blue} creating the onion container${reset}"

docker build -t onion .

echo "${cyan}Docker${blue} showing images${reset}"

docker images

echo "${cyan}Docker${blue} running onion container${reset}"

docker run -it --name onion -p 80:80 -p 4242:4242 onion
