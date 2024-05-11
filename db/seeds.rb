User.create!(
    email: "admin@admin.com",
    firstname: 'Kiyo',
    lastname: 'Script',
    gender: 'male',
    role: "administrator",
    password: "123123123",
    password_confirmation: "123123123"
  )

User.create!(
  email: "kiyo@staff.com",
  firstname: 'John Lloyd',
  lastname: 'de Sape',
  gender: 'male',
  role: "staff",
  password: "123123123",
  password_confirmation: "123123123"
)

Patient.create!(
  firstname: 'Arnel',
  middle_initial: 'A.',
  lastname: 'Jocosol',
  birthdate: DateTime.now,
  age: 20,
  gender: 'male',
  address_line: 'Brgy. Linao',
  contact_number: '09123456789',
  temperature: 25.5,
  blood_pressure: "80/160",
  heart_rate: 80,
  weight: 70,
  height: 180,
  bmi: 3.3,
  spo_2: 'SPO2',
  length: 85.0,
  body_circumference: 97.0,
  muac: 38.0,
  head_circumference: 10.0,
  hip: 11.0,
  limbs: 68.0,
  z_score: "86",
  user_id: 1
)
