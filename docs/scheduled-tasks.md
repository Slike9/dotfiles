# Scheduled tasks for dotfiles

Create two standalone tasks in Scheduled. Select the local project
`/home/sergey/.dotfiles`. Use timezone `Europe/Samara` (UTC+4).
Each run should start a new chat and return its report in Scheduled.

These are task definitions for manual creation; saving this file does not enable
scheduled execution. The computer must be on, the desktop app running and the
local project available. Enable web search for fresh official sources.

## Check installation commands

Schedule: every Monday at 09:00, Europe/Samara.

Prompt:

```text
В проекте /home/sergey/.dotfiles используй $check-install-commands.
Если скилл не найден автоматически, прочитай
.agents/skills/check-install-commands/SKILL.md и следуй его инструкциям.

Проверь команды установки и shell-интеграции по свежей официальной документации.
Укажи дату проверки и проверенные локальные версии. Сообщи о подтверждённо
устаревших командах, несовместимости локальных версий и пробелах проверки.
Для проблем приведи файл и строку, сценарий отказа, актуальную замену и прямую
ссылку на официальный источник. Если проблем нет, верни короткое сообщение
об этом с областью проверки и источниками.

Не изменяй файлы проекта или настоящий HOME, не устанавливай и не обновляй
пакеты, не запускай реальные установщики, не делай commit/push.
Безопасные проверки выполняй по инструкциям скилла. Результат верни в ответе.
```

## Find useful improvements

Schedule: the first day of every month at 09:00, Europe/Samara.

Prompt:

```text
В проекте /home/sergey/.dotfiles используй $improve-dotfiles.
Если скилл не найден автоматически, прочитай
.agents/skills/improve-dotfiles/SKILL.md и следуй его инструкциям.

Изучи текущие конфиги и свежие официальные релизы используемых инструментов.
Найди устаревшие решения, полезные новые возможности и новые инструменты,
которые могут улучшить конкретные задачи этого проекта.
Укажи дату исследования. Верни короткий нумерованный список предложений
по приоритету: место в проекте, предлагаемое изменение, польза, требуемая
версия, стоимость перехода, риски и прямой официальный источник.
Отдели подтверждённые выводы от гипотез; не добавляй инструменты только
ради новизны. Заверши рекомендацией, с чего начать.
Если полезных изменений нет, скажи это прямо.

Не изменяй файлы проекта или настоящий HOME, не устанавливай и не обновляй
пакеты, не запускай реальные установщики, не делай commit/push.
Результат верни в ответе; внедрение пользователь выберет отдельно.
```
