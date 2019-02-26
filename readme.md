# Скрипт для установки полных прав на папку Digispot II
================================================================
Roman Ermakov <r.ermakov@emg.fm>

v1.00 2018-06-07 Initial release

v1.01 2018-08-24 Rewritten on PowerShell


К сожалению, исторически Digispot II хранит локальные настройки не в C:\ProgramData, а в C:\Program Files\Disigpot II\DJin.
Поэтому после установки ПО Digispot II требуется [дать пользователям полные права на эту папку][1].

Перед использованием убедитесь, что пользователь, от имени которого будет запускаться Digispot, находится в группе локальных пользователей (.\Users) -
пользователи домена (Domain Users), как правило, в группу локальных пользователей входят.

[1]: https://redmine.digispot.ru/projects/digispot/wiki/%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_%D0%B8_%D0%B1%D0%B0%D0%B7%D0%BE%D0%B2%D0%B0%D1%8F_%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0_%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D1%8B_Digispot_II#%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0-%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%BE%D0%B9-%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D1%8B