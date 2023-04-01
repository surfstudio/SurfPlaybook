# Changelog

## 1.5.0

- `CellConfigurable` протокол переименован на `PlaybookCellConfigurable`, чтобы исключить конфликт имен с протоколом из `RDDM` [#14](https://github.com/surfstudio/SurfPlaybook/pull/14)

## 1.4.0

- Поправлен код для TableViewCellContainer, теперь можно работать с отображением ячеек из SPM-пакетов [#13](https://github.com/surfstudio/SurfPlaybook/pull/13)

## 1.3.1

- Правки адаптации под iOS 15, убраны deprecated вызовы нативных библиотек [#12](https://github.com/surfstudio/SurfPlaybook/pull/12)

## 1.3.0

- Добавлена адаптация под iOS 15 [#11](https://github.com/surfstudio/SurfPlaybook/pull/11)

> закрыт issue [Black background of navigationBar in iOS 15](https://github.com/surfstudio/SurfPlaybook/issues/10)

## 1.2.2

- Интерфейс не изменился, новые фичи не добавились - просто проверка работоспособности либы и работы CI после переезда и правок в readme [#8](https://github.com/surfstudio/SurfPlaybook/pull/8)

## 1.2.1

- Отдельный экран для отображения всех компонентов из одной главы [#6](https://github.com/chausovSurfStudio/SurfPlaybook/pull/6)

## 1.2.0

- Появилась возможность в третьем табе с flow-координаторами реализовать вложенную структуру экранов [#4](https://github.com/chausovSurfStudio/SurfPlaybook/pull/4)

> Для корректной миграции обратите внимание на документацию к протоколу `PlaybookFlowCoordinator`

## 1.1.0

- Добавлена поддержка SPM [#2](https://github.com/chausovSurfStudio/SurfPlaybook/pull/2)

## 1.0.0

- Отображение UI-компонентов, поиск, детальный просмотр
- Возможность добавлять несколько состояний для одного UI-компонента
- Отображение контента для UIKit в табличных экранах
- Возможность задания точек входа на необходимые экраны через **Playbook**