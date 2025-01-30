Tattoo = {}
Tattoo.AllTattooList = json.decode(LoadResourceFile(GetCurrentResourceName(), 'Modules/Utils/TattooShop/AllTattoos.json'))

Tattoo.TattooCats = {
	{"ZONE_HEAD", "Tête", {vec(0.0, 0.7, 0.7), vec(0.7, 0.0, 0.7), vec(0.0, -0.7, 0.7), vec(-0.7, 0.0, 0.7)}, vec(0.0, 0.0, 0.5)},
	{"ZONE_LEFT_LEG", "Jambe gauche", {vec(-0.2, 0.7, -0.7), vec(-0.7, 0.0, -0.7), vec(-0.2, -0.7, -0.7)}, vec(-0.2, 0.0, -0.6)},
	{"ZONE_LEFT_ARM", "Bras gauche", {vec(-0.4, 0.5, 0.2), vec(-0.7, 0.0, 0.2), vec(-0.4, -0.5, 0.2)}, vec(-0.2, 0.0, 0.2)},
	{"ZONE_RIGHT_LEG", "Jambe Droite", {vec(0.2, 0.7, -0.7), vec(0.7, 0.0, -0.7), vec(0.2, -0.7, -0.7)}, vec(0.2, 0.0, -0.6)},
	{"ZONE_TORSO", "Torse", {vec(0.0, 0.7, 0.2), vec(0.0, -0.7, 0.2)}, vec(0.0, 0.0, 0.2)},
	{"ZONE_RIGHT_ARM", "Bras droit", {vec(0.4, 0.5, 0.2), vec(0.7, 0.0, 0.2), vec(0.4, -0.5, 0.2)}, vec(0.2, 0.0, 0.2)},
}

Tattoo.Shop = {
    vector3(322.749024, 180.582428, 103.586486),
	vector3(-293.791900, 6200.456542, 31.487122),
	vector3(1863.956420, 3747.346680, 33.031834),
	vector3(-1154.078858, -1426.101684, 4.954466),
	vector3(1322.772950, -1652.707886, 52.275306),
	vector3(5154.678710, -5124.542968, 2.407)
}