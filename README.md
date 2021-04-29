# SurfPlaybook

iOS framework for Playbook 

[![SurfPlaybook](https://i.ibb.co/DY0GQ1F/1026.png)](https://github.com/chausovSurfStudio/SurfPlaybook)

## About

Библиотека для быстрого и легкого построения playbook-а проекта, который бы включал в себя его основные UI-компоненты,
а также, при необходимости, давал бы возможность быстрого доступа к его основным экранам.

## Screenshots

![SurfPlaubookScreenshots](https://i.ibb.co/Dfzw28m/Group-5765.png)

## Installation

При использовании CocoaPods:

```ruby
pod 'SurfPlaybook'
```

## Features

При создании библиотеки преследовались следующие цели: создать площадку для тестирования и наглядного отображения всех переиспользуемых компонентов проекта

- что могло бы помочь как при проектировании новых фич
- так и при взаимодействии с дизайн-отделом
- облегчило бы вход новых разработчиков в проект
- и ускорило бы разработку

Для этого были реализованы следующие фичи:

- **Chapters-Page** - система глав и страниц, как в настоящей книге, где каждой главе соответствует набор UI-компонентов, объединенных по смыслу общим принаком,
а каждой странице - непосредственно сам UI-компонент
- общее отображение всех UI-компонентов, поиск по названию, а также детальный просмотр компонента
- возможность задать набор различных состояний для одного UI-компонента и возможность переключения между ними при его детальном просмотре
- **UIKit Pages** - механика для построения полноценного UIKit-а проекта, где вам будет дана возможность заполнить табличные экраны необходимыми именно вам данными,
для, например, отображения цветовой палитры приложения, или же для отображения всех доступных стилей кнопок
- **Flow Coordinators** - возможность задать точку входа на любой экран приложения, или же получить возможность подключить тестовый экран-playground
для тестирования новых UI-компонентов в процессе их разработки
- возможность кастомизации цветовой палитры и текстов playbook-а

## Example

Все вышеперечисленное можно увидеть в Example-проекте. Для его корректного запуска и конфигурации скачайте репозиторий и выполните команду `make init` перед тем как его запустить.

## Usage

Доступ к playbook осуществляется через singleton

```swift
Playbook.shared
```

Дальнейшая работа с ним заключается в двух шагах

```swift
func application(_ application: UIApplication,
                 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = UIViewController()
    window?.makeKeyAndVisible()

    // 1
    Playbook.shared
        .add(chapter: ControlsChapter().build())
        .add(uiKitPage: ColorsUIKitPage())
        .add(flowCoordinator: AuthFlowCoordinator())

    // 2
    Playbook.shared.start(from: self.window)
    return true
}
```
 

1. Заполнить playbook необходимыми вам данными
2. Запустить playbook, передав в качестве параметра `KeyAndVisible`-window, в рамках которого отображается приложение

При необходимости - перед шагом `[2]` можно изменить цветовую палитру playbook-а и вшитые в него тексты на подходящие именно вам (для этого предусмотрены `ColorsConfig` и `StringsConfig`).

## Changelog

Список всех изменений можно посмотреть в этом [файле](./CHANGELOG.md).

## License

[MIT License](./LICENSE)
