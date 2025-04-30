-- Create table example
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  role VARCHAR(20) DEFAULT 'staff'
);

-- Insert sample user
INSERT INTO users (name, email, role)
VALUES 
  ('Chairman Aws', 'aws@aws-legalgroup.com', 'chairman')
ON CONFLICT DO NOTHING;
