
## SMS-ALERTS

El escenario principal es generar una base de datos de voluntarios y expertos que estén cerca de las zonas de desastre, para movilizarlos y mantenerlos informados de cómo y dónde pueden ayudar; la meta principal es coordinar esfuerzos entre la comunidad.

### Escenarios Actuales - 21/09/2017

Como voluntario registro mis datos y número telefónico,
especifico en qué áreas puedo ayudar y elijo en qué zonas me encuentro para poder ayudar.

Como _manager_ mando mensajes de alertas de SMS según la descripción y el área en específico.

Por ejemplo, si se necesita ayuda en el centro de Morelos para remover escombros.

Escribo la alerta y le mando el SMS a los voluntarios que cumplan con las condiciones anteriores (zona y tipo de ayuda).

### Staging

https://sismomx-sms.herokuapp.com/

### Instalación

#### Pre-requisitos

- Rails 5.0.6
- Ruby 2.3.x (se han reportado errores con Ruby 2.4.x)
- Base de datos Postgres
- Bundler

#### Pasos para instalar

1. Clonar el repositorio:  

        $ git clone git@github.com:denialtorres/SMS-ALERTS.git

2. Instalar las gemas del proyecto:

        $ bundle install
        
3.  Crear la base de datos: 
  
        $ rails db:create
    
4. Ejecutar las migraciones de la base de datos: 

        $ rails db:migrate
     
5. Realizar la carga inicial de la base de datos: 

        $ rails db:seed

6. Ejecutar el servidor de rails: 

        $ rails s


# ENGLISH

The main scenario is to create a database of volunteers and experts who are close to the disaster areas, mobilize them and keep them informed of how and where they can help; the main goal being coordinating all efforts among the community.

## Current Scenarios - 09/21/2017

As a volunteer, I register my data and telephone number,
specify in which areas I can help and choose on which locations i'll be able to help.

As manager, I send SMS alert messages according to the problem and the specific area where it is this happening.

For example, if you need help in the center of Morelos to remove debris.

I write the alert and send the SMS to the volunteers who meet the above conditions (area and type of of help).
