# MLB-Database-Project

![Major_League_Baseball_logo](https://github.com/user-attachments/assets/becb09fe-eb1f-4eb5-943b-b55768a972b1)

### Overview
This project involves creating a comprehensive SQL database for Major League Baseball (MLB) to manage and analyze historical data from the last 10 years. The database is designed to support MLB initiatives, such as marketing, merchandise, and media production, by providing a structured data infrastructure for strategic decision-making.

### Key Components
- **Entities and Relationships**: The database includes key entities such as Ballparks, Rosters, World Series games, Player Biographical Data, Games, and Game Statistics. Each table is meticulously designed with primary keys, foreign keys, and constraints to ensure data integrity. Many-to-many relationships are handled using junction tables to maintain normalized and efficient data structures.
- **Data Model**: The database follows a relational model with tables in the 3rd normal form, ensuring minimal redundancy. Relationships between entities are implemented using foreign keys in junction tables, which help in converting many-to-many relationships into one-to-many relationships.

### Business Use Cases
1. **Vintage Ballpark T-Shirt Campaign**: Query ballpark data to create vintage graphic t-shirts for ballparks that have hosted multiple World Series games.
2. **2017 Astros Cheating Scandal Documentary**: Retrieve the roster of the 2017 Astros team involved in the cheating scandal for a documentary.
3. **Holiday Game Cards**: Provide data on historic MLB games played on holidays like Cinco de Mayo and the 4th of July for creating collectible game cards.
4. **Age-Based Marketing Campaign**: Analyze the age distribution of players to target marketing campaigns for new adult beverage products.
5. **Ice Cream Demand Analysis**: Query attendance data from Chase Field in Arizona during the summer to help an MLB partner estimate ice cream demand.

### Future Enhancements
- **Advanced Analytics**: Implement SQL queries for deeper statistical analysis, such as calculating batting averages, player rankings, and team averages.
- **Player Injury Tracking**: Introduce a table for tracking player injuries and missed games, along with triggers to automate updates.
- **Real-Time Updates**: Use tools like Kafka for real-time game scores, player statistics, and league standings, with notification services based on alerts.

This project demonstrates the ability to design and implement a complex database system that supports a wide range of business needs, ensuring data accuracy and providing valuable insights for MLB's operations and marketing strategies.
