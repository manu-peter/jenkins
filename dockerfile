#First create a file named dockerfile in the github repo and type the first 3 lines of this file

FROM httpd                                                    
COPY index.html /usr/local/apache2/htdocs
EXPOSE 80
