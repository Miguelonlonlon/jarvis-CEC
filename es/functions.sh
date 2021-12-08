jv_pg_ct_fonction_CEC_ETAT() {
say "Voy a mirarlo, un momento..."
etatTV=`echo pow 0 | cec-client -s -d 1`

if [[ "$etatTV" =~ ": on" ]]; then
say "La Tele está encendida"
fi

if [[ "$etatTV" =~ ": standby" ]]; then
say "La Tele está apagada"
fi

if [[ "$etatTV" =~ ": unknown" ]]; then
say "No puedo comunicarme con ella, debe estar desconectada de la corriente. "
# say "Je n'arrive pas à communiquer avec la télé, Désolé je ne connais pas son état"
fi
} 


jv_pg_ct_fonction_CEC_ETEINT() {
echo standby 0 | cec-client -s -d 1 >/dev/null
say "Apagando la tele"
sleep 2
fonction_CEC_vérif_OFF
}

jv_pg_ct_fonction_CEC_ALLUME() {
say "Encendiendo la tele"
echo on 0 | cec-client -s -d 1 >/dev/null
sleep 2
fonction_CEC_vérif_ON
}

jv_pg_ct_fonction_CEC_SOURCE() {
say "Cambiando al CEC activo"
echo 'as'|cec-client –s >/dev/null
}

fonction_CEC_vérif_OFF() {
etatTV=`echo pow 0 | cec-client -s -d 1`
if [[ "$etatTV" =~ ": on" ]]; then
say "La Tele sigue encendida, debe haber algún fallo, voy a forzar el apagado."
echo standby 0 | cec-client -s -d 1 >/dev/null
fi

}

fonction_CEC_vérif_ON() {
etatTV=`echo pow 0 | cec-client -s -d 1`
if [[ "$etatTV" =~ ": standby" ]]; then
say "La Tele no quiere encenderse, voy a forzarle un encendido"
echo on 0 | cec-client -s -d 1 >/dev/null
fi
}
