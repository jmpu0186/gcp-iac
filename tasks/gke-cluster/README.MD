TASK 1
==========
_Permite aprovisionar un cluster GKE con su ingress-controller y desplegar una aplicacion python_
### Instalación 🔧

_Configurar las variables segun su cuenta GCP, en el archivo variables.tf_
```
name : "nombre del cluster"
project_name: "nombre de su proyecto GCP"
location: "location asociada a su cuenta GCP"
zone: "zone asociada a su cuenta GCP"
"initial_node_count": "cantidad de nodos del cluster, por defecto 1"
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

_Una vez terminado el aprovisionamiento se podra ingresar a la aplicacion python desde el ingress-controlller_
```
http://IP_INGRESS_CONTROLLER/greetings
```
```
http://IP_INGRESS_CONTROLLER/square/{numero}
```