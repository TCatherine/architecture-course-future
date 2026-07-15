# Каталог доменных событий «Будущее 2.0»

Общие правила: события — факты в прошедшем времени; схемы (Avro) регистрируются в Schema Registry с проверкой BACKWARD-совместимости; каждый топик имеет владельца-контекст; PHI (содержимое медкарт и исследований) в события не включается — только идентификаторы. Обязательный конверт каждого события: `event_id` (UUID, идемпотентность), `occurred_at`, `source_context`, `schema_version`, `trace_id`.

## События и подписчики

| Событие (топик)                        | Контекст-источник  | Семантика                                    |
| -------------------------------------- | ------------------ | -------------------------------------------- |
| `patient.registered`                   | Пациентский поток  | Зарегистрирован новый пациент                |
| `appointment.scheduled`                | Пациентский поток  | Создана запись на приём                      |
| `appointment.cancelled`                | Пациентский поток  | Запись отменена                              |
| `encounter.completed`                  | Пациентский поток  | Приём завершён, услуги оказаны               |
| `study.ordered`                        | Мед. данные        | Назначено исследование                       |
| `study.completed`                      | Мед. данные        | Исследование выполнено                       |
| `ai.assessment.completed`              | ИИ-диагностика     | Пройдено исследование ИИ, заключение готово  |
| `ai.model.deployed`                    | ИИ-диагностика     | Развёрнута новая версия модели               |
| `invoice.issued`                       | Счета и платежи    | Счёт выставлен                               |
| `payment.received`                     | Счета и платежи    | Платёж получен                               |
| `loan.application.submitted`           | Кредитование       | Кредитная заявка подана                      |
| `fraud.risk.scored`                    | Антифрод           | Риск по заявке/транзакции оценён             |
| `loan.agreement.created`               | Кредитование       | Создан кредитный договор                     |
| `loan.payment.overdue`                 | Кредитование       | Просрочен платёж по кредиту                  |
| `customer.created` / `customer.merged` | Клиентский профиль | Профиль клиента группы создан / объединён    |
| `hr.employee.hired` / `terminated`     | Персонал           | Изменение штата                              |
| `inventory.stock.low`                  | Инвентаризация     | Запас ниже порога                            |
| `legacy.dwh.*`                         | DWH                | Изменения легаси-таблиц на переходный период |


## Минимальные контракты ключевых событий

### 1. patient.registered - «Зарегистрирован новый пациент»

```json
{
  "event_id": "uuid", 
  "occurred_at": "ts", 
  "schema_version": "1.0",
  "patient_id": "uuid",
  "customer_id": "uuid | null",
  "clinic_id": "uuid",
  "consent_scope": ["treatment", "analytics"]
}
```

### 2. encounter.completed - «Приём завершён»

```json
{
  "event_id": "uuid", 
  "occurred_at": "ts", 
  "schema_version": "1.0",
  "encounter_id": "uuid", 
  "patient_id": "uuid", 
  "clinic_id": "uuid",
  "services": [{"service_code": "str", "qty": "int", "price": "decimal"}],
  "study_refs": ["study_id"]
}
```

### 3. ai.assessment.completed - «Пройдено исследование ИИ»

```json
{
  "event_id": "uuid", 
  "occurred_at": "ts", 
  "schema_version": "1.0",
  "assessment_id": "uuid", 
  "study_id": "uuid", 
  "encounter_id": "uuid",
  "model_id": "str", 
  "model_version": "str",
  "result_class": "str", 
  "confidence": "float",
  "requires_physician_review": true
}
```

### 4. invoice.issued - «Счёт выставлен»

```json
{
  "event_id": "uuid", 
  "occurred_at": "ts", 
  "schema_version": "1.0",
  "invoice_id": "uuid", 
  "encounter_id": "uuid | null",
  "customer_id": "uuid",
   "amount": "decimal", 
   "currency": "RUB",
  "due_date": "date"
}
```

### 5. loan.agreement.created - «Создан кредитный договор»

```json
{
  "event_id": "uuid", 
  "occurred_at": "ts", 
  "schema_version": "1.0",
  "agreement_id": "uuid", 
  "application_id": "uuid", 
  "customer_id": "uuid",
  "principal": "decimal", 
  "currency": "RUB", 
  "term_months": "int",
  "rate_pct": "decimal",
"purpose_ref": "invoice_id | null"
}
```

### 6. fraud.risk.scored - «Риск оценён»

```json
{
  "event_id": "uuid", 
  "occurred_at": "ts", 
  "schema_version": "1.0",
  "score_id": "uuid", 
  "subject_type": "loan_application | transaction",
  "subject_id": "uuid", 
  "score": "int", 
  "decision_hint": "approve | review | reject",
  "rules_version": "str"
}
```

