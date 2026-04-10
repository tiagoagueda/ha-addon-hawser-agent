# Hawser Agent – Add-on Home Assistant OS

## ⚠️ Requirements

> **Protection Mode must be disabled**
>
> This addon requires access to the Docker socket (`/var/run/docker.sock`) via the HA Supervisor `docker_socket` map.
>
> After installing the addon, go to **Settings → Add-ons → Hawser Agent → Info** and **disable Protection Mode**. Without this step the addon will fail to start.

![Dockhand Logo](logo.png)

## 📌 Présentation

Cet add-on permet d’exécuter **Hawser** sur **Home Assistant OS** afin de connecter l’hôte Home Assistant à **Dockhand**.

👉 **Cet add-on est uniquement un agent Docker pour Dockhand.**
Il n’ajoute aucune intégration Home Assistant, aucune entité, aucun service HA.

Son rôle est simple :

* exposer l’API Docker de Home Assistant à Dockhand
* via une connexion **sortante sécurisée (Edge mode)**

---

## 📜 Licence

MIT

---

Add-on minimal, sécurisé, orienté production 🚀
