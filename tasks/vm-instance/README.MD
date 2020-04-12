TASK 2
==========

Permite aprovisionar por terraform una instacia CENTOS7.
Se conecta al repositorio git https://github.com/jmpu0186/ansible-gcp.git, para instalar docker y jenkins usando ANSIBLE

### Instalación 🔧

_Configurar las variables segun su cuenta GCP, en el archivo variables.tf_
```
name : "nombre del cluster"
project_name: "nombre de su proyecto GCP"
location: "location asociada a su cuenta GCP"
zone: "zone asociada a su cuenta GCP"
machine_type: "tipo de instancia a crear para GCP"
```

_Dar permiso al sh_

```
chmod +x aprovisionar.sh
```

_Para crear la instancia_

```
./aprovisionar.sh CREATE
```

_Para eliminar la instancia_
```
./aprovisionar.sh DESTROY
```