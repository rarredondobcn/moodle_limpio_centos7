# Moodle limpio | Vagrant
![Logo](https://www.emagister.com/assets/es/logos/centro/id/92772/size/l.jpg)

Este [Vagrant](https://developer.hashicorp.com/vagrant) crea un moodle limpio, que corre sobre un debian buster.
Para modificar las versiones de php, de moodle, de mariadb hay que modificar el script.sh

## Correr en local
Instalar [VirtualBox 6.0 - 6.1](https://www.virtualbox.org/wiki/Download_Old_Builds_6_1)

Instalar [Vagrant](https://developer.hashicorp.com/vagrant/downloads)

Clonar el proyecto

```bash
  git clone https://github.com/moodle/moodle.git
```

Ir a la carpeta del directorio
```bash
  vagrant plugin install vagrant-vbguest --plugin-version 0.21
```

```bash
  vagrant up
```

## Comandos útiles
```bash
  vagrant up
```
Acceder por ssh
```bash
  vagrant up
```
Apagar entorno
```bash
  vagrant halt
```
Borrar entorno de el disco virtual
```bash
  vagrant destroy
```
Reiniciar entorno al estado inicial y correr el script de arranque
```bash
  vagrant reload
```
Ejecuta el script si se actualizó, ejecutar si hay cambios
```bash
  vagrant reload
```

Al terminar de Instalar el script, se accede a moodle a través de la direción 192.168.0.10, o si previamente hemos configurado nuestro archivo hosts a la ip antes mencionada podemos acceder desde moodle.test

## Documentación de Vagrant

[Documentación](https://developer.hashicorp.com/vagrant/docs)

Otras recetas de [Vagrant](https://app.vagrantup.com/boxes/search)


## Authors

- [@rarredondobcn](https://github.com/rarredondobcn)
- [@ricardo77a](https://github.com/ricardo77a)
