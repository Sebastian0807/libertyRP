--Resource creado por: Redemtion
--Visita a mi Facebook: https://www.facebook.com/profile.php?id=100008539817990&fref=ts

txd = engineLoadTXD("autos/tropic.txd")
engineImportTXD(txd, 454)
dff = engineLoadDFF("autos/tropic.dff", 454)
engineReplaceModel(dff, 454)

txd = engineLoadTXD("autos/tram.txd")
engineImportTXD(txd, 449)
dff = engineLoadDFF("autos/tram.dff", 449)
engineReplaceModel(dff, 449)

txd = engineLoadTXD("autos/nevada.txd")
engineImportTXD(txd, 553)
dff = engineLoadDFF("autos/nevada.dff", 553)
engineReplaceModel(dff, 553)

txd = engineLoadTXD("autos/journey.txd")
engineImportTXD(txd, 508)
dff = engineLoadDFF("autos/journey.dff", 508)
engineReplaceModel(dff, 508)

txd = engineLoadTXD("autos/hotdog.txd")
engineImportTXD(txd, 588)
dff = engineLoadDFF("autos/hotdog.dff", 588)
engineReplaceModel(dff, 588)
