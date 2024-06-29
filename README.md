## Projekt Systemu Rezerwacji Miejsc Parkingowych

Projekt ten ma na celu stworzenie aplikacji umożliwiającej rezerwację miejsc parkingowych na firmowym parkingu na określone godziny w ciągu tygodnia.

### Funkcje systemu:
- **Lista użytkowników**: Przechowuje informacje o użytkownikach, którzy mogą rezerwować miejsca parkingowe.
- **Lista parkingów**: Przechowuje informacje o dostępnych miejscach parkingowych. Formularz dodawania i edycji, usuwanie
- **Lista miejsc parkingowych**: Przechowuje informacje o dostępnych miejscach parkingowych. Formularz dodawania i edycji, usuwanie
- **Lista rezerwacji dla danego miejsca parkingowego**: Przechowuje informacje o dokonanych rezerwacjach, w tym użytkownika który dokonał rezerwacji, zarezerwowane miejsce oraz czas rezerwacji.

#### Must Have
- System powinien wyszukiwać wolne miejsce dla określonego dnia i zakresu czasu. 
- W pierwszym kroku wybór użytkownika z listy. 
- Miejsca już zarezerwowane na dany dzień nie powinny dać się zarezerwować.
- Rezerwacje specjalne mogą być robione na dowolny czas do przodu
- Rezerwacje standardowe mogą być robione na jeden tydzień do przodu
- Rezerwacje mogą być usuwane z systemu zanim czas parkowania się nie rozpocznie
#### Optional
- W kolejnym kroku dodanie autoryzacji, użycie zalogowanego użytkownika do rezerwacji. Tylko admin może edytować miejsca parkingowe i usuwać rezerwacje innych użytkowników.


System będzie składał się z czterech głównych tabel w bazie danych: użytkowników parkingu, miejsc parkingowych i rezerwacji.

### ParkingHouses
| Column Name | Data Type    | Constraints                 |
|-------------|--------------|-----------------------------|
| id          | INT          | PRIMARY KEY, AUTO_INCREMENT |
| name        | VARCHAR(255) | NOT NULL                    |
| location    | VARCHAR(255) |                             |

### ParkingUsers
| Column Name | Data Type     | Constraints                 |
|-------------|---------------|-----------------------------|
| id          | INT           | PRIMARY KEY, AUTO_INCREMENT |
| name        | VARCHAR(255)  | NOT NULL                    |
| email       | VARCHAR(255)  | NOT NULL, UNIQUE            |
| phone       | VARCHAR(20)   | NOT NULL                    |

### ParkingPlaces
| Column Name           | Data Type     | Constraints                                        |
|-----------------------|---------------|----------------------------------------------------|
| id                    | INT           | PRIMARY KEY, AUTO_INCREMENT                        |
| number                | VARCHAR(255)  | NOT NULL                                           |
| parking_house_id      | INT           | FOREIGN KEY REFERENCES ParkingHouses(id), NOT NULL |


### Reservations
| Column Name      | Data Type     | Constraints                                        |
|------------------|---------------|----------------------------------------------------|
| id               | INT           | PRIMARY KEY, AUTO_INCREMENT                        |
| parking_user_id  | INT           | FOREIGN KEY REFERENCES ParkingUsers(id), NOT NULL  |
| parking_place_id | INT           | FOREIGN KEY REFERENCES ParkingPlaces(id), NOT NULL |
| start_time       | DATETIME      | NOT NULL                                           |
| end_time         | DATETIME      | NOT NULL                                           |
| type             | VARCHAR(255)  | NOT NULL                                           |


### Narzędzia:
- spring boot
- lombok
- spring data jpa
- spring security (?)
- thymeleaf
- bootstrap
- mysql