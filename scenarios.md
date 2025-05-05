⸻

Zestaw scenariuszy testowych dla projektu (zgodny z koncepcją)

Scenariusz 1: Tworzenie pojedynczej VM

Cel: Sprawdzić, czy VM z cloud-init działa poprawnie i ma dostęp do Internetu.
Zakres:
	•	Utworzenie VM przez virt-install
	•	Cloud-init z kontem ubuntu i kluczem SSH
	•	Sieć NAT (default)
	•	Test: SSH, ping 8.8.8.8, apt update

⸻

Scenariusz 2: Dwie VM w NAT, test komunikacji

Cel: Sprawdzić, czy maszyny w tej samej sieci NAT mogą się komunikować.
Zakres:
	•	2 VM w sieci default
	•	Adresacja przez DHCP
	•	Test: ping, curl z jednej VM do drugiej
	•	Test: komunikacja z hostem i Internetem

⸻

Scenariusz 3: Dwie VM w bridge network

Cel: Przetestować połączenie VM z siecią fizyczną i z sobą nawzajem.
Zakres:
	•	Tworzenie mostka (bridge) na hoście
	•	2 VM w tej samej bridgowanej sieci
	•	Adresacja przez router domowy (DHCP)
	•	Testy: ping, ssh z laptopa do VM

⸻

Scenariusz 4: Sieć isolated

Cel: Przetestować całkowicie odizolowaną sieć (brak dostępu z/na zewnątrz).
Zakres:
	•	Własna sieć libvirt typu isolated
	•	2 VM z adresacją przez dnsmasq
	•	Brak połączenia z hostem i Internetem
	•	Testy:
	•	✅ ping między VM
	•	🚫 ping do hosta lub Internetu
	•	🚫 curl localhost:... z VM


Scenariusz 5: Statyczna konfiguracja IP

Cel: Przetestować działanie statycznej adresacji IP przez cloud-init.
Zakres:
	•	VM z ręcznie nadanym IP
	•	Konfiguracja przez netplan/cloud-init
	•	Test: ip a, ping, sprawdzenie konfliktów

⸻

Scenariusz 6: NAT + port forwarding

Cel: Umożliwić dostęp do VM z hosta mimo NAT.
Zakres:
	•	1 VM w sieci NAT
	•	Forwardowanie portu 2222 → 22 (SSH)
	•	Test: ssh -p 2222 localhost
	•	Test: curl localhost:8080 (jeśli HTTP)

⸻

Scenariusz 7: Filtrowanie ruchu (firewall)

Cel: Zablokować lub zezwolić na wybrane typy połączeń między VM.
Zakres:
	•	iptables lub ufw w VM
	•	Blokada ruchu ICMP (ping)
	•	Dozwolony tylko port 80 lub 22
	•	Test: ping, curl, nmap z drugiej VM

⸻

✅ Format techniczny:
	•	playbooks/scenario_*.yaml – każdy scenariusz osobno
	•	vars/scenario_*.yaml – definicje VM, IP, sieci
	•	roles/vm/ – wspólna logika tworzenia VM, provisioning, cloud-init
	•	inventory/hosts – dynamicznie aktualizowane wpisy

⸻
