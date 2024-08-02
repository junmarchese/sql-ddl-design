INSERT INTO Regions
    (name)
VALUES
    ('Dallas'), ('Raleigh');


INSERT INTO Users
    (username, encrypted_password, preferred_region_id)
VALUES
    ('user1', 'hashed_password', 1), ('user2', 'hashed_password', 2);


INSERT INTO Categories
    (name)
VALUES
    ('cars'), ('apartments');


INSERT INTO Posts (title, text, location, user_id, region_id, category_id)
VALUES
    ('Used Car for Sale', 'Reliable Honda sedan with low mileage', '12345 Beach St, Raleigh, NC', 1, 2, 1);

INSERT INTO Posts (title, text, location, user_id, region_id, category_id)
VALUES
    ('Apartment for rent', 'Spacious and clean 1 bedroom apartment in Downtown area', '4567 Dallas St, Dallas, TX', 2, 1, 2);

    




