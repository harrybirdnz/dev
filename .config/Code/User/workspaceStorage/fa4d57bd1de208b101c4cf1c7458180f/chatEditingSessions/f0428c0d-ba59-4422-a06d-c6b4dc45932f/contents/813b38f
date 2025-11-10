#import "@preview/simple-technical-resume:0.1.0": *

#let name = "Harry Bird"
#let phone = "+64 2041357900"
#let email = "harry@harrybird.nz"
#let github = "harrybirdnz"
#let personal-site = "harrybird.nz"

#show: resume.with(
  top-margin: 0.45in,
  personal-info-font-size: 10pt,
  author-position: center,
  personal-info-position: center,
  author-name: name,
  phone: phone,
  email: email,
  website: personal-site,
  github-username: github
)

#custom-title("Education")[
  #education-heading(
    "University of New South Wales", "Sydney, Australia",
    "Master of Data Science", "",
    datetime(year: 2024, month: 1, day: 1),
    datetime(year: 2025, month: 10,  day: 1)
  )[
  ]
  #education-heading(
    "University of Canterbury", "Christchurch, New Zealand",
    "Bachelor of Engineering (Honours)", "Mechanical Engineering, Minor in Aerospace Engineering",
    datetime(year: 2020, month: 2, day: 1),
    datetime(year: 2023, month: 11,  day: 1)
  )[
  ]
]

#custom-title("Experience")[  
  #work-heading(
    "Full Stack Web Developer (Part Time)",
    "Gabion1",
    "Wellington, NZ",
    datetime(year:2023, month:11, day:1),
    "Present"
  )[
    - Led digital transformation initiative migrating legacy MS Access database to cloud-native web application using Supabase BaaS platform with PostgreSQL, implementing RESTful APIs and real-time data synchronization
    - Engineered responsive eCommerce platform utilizing Nuxt.js with real-time inventory management, enhancing user experience and conversion optimization
    - Designed business intelligence dashboards using JavaScript packages and complex SQL queries to provide actionable insights on KPIs, sales analytics, and revenue forecasting
  ]

  #work-heading(
    "Building Services Engineering Intern",
    "Aurecon",
    "Christchurch, NZ",
    datetime(year:2022, month:11, day:1),
    datetime(year:2023, month:2, day:1),
  )[
    - Collaborated with multidisciplinary teams delivering sustainable HVAC solutions for commercial building projects, conducting energy audits and optimization analysis for high-performance building systems
    - Performed thermal modeling and CFD simulations to calculate heat load analysis and optimize HVAC system design for energy efficiency
  ]
]

#custom-title("Projects")[
  #project-heading(
    "Central America Rail Network Feasibility Study | Transportation Engineering & Data Analytics",
  )[
    - Conducted comprehensive feasibility analysis for passenger and freight rail infrastructure development, performing stakeholder analysis, risk assessment, and market evaluation
    - Applied quantitative methodologies including financial modeling, Monte Carlo simulations, and sensitivity analysis to evaluate project viability and ROI projections
  ]
  #project-heading(
    "IoT Weather Monitoring & Data Acquisition System | Full-Stack Development",
  )[
    - Engineered end-to-end IoT solution using Arduino microcontroller and embedded systems programming for real-time environmental data collection
    - Deployed self-hosted solution on Linux server using Docker containerization with data visualization dashboard
  ]
]


#custom-title("Technical Skills")[
  #skills()[
    - *Programming:* Python, JavaScript, TypeScript, SQL (PostgreSQL), R, MATLAB, Shell Scripting
    - *Web Development:* Nuxt.js, Vue.js, SvelteKit, Node.js, RESTful APIs
    - *Data Science & ML:* Pandas, NumPy, Scikit-learn, TensorFlow, PyTorch, Statistical Analysis, Predictive Modeling, Feature Engineering, Data Visualization (Matplotlib, Plotly), Jupyter Notebooks
    - *Database & Backend:* PostgreSQL, Supabase, Database Design, Query Optimization, Prisma, Data Warehousing
    - *DevOps & Cloud:* Docker, Git/GitHub, CI/CD Pipelines, Linux Administration, Cloud Deployment (Vercel, Netlify)
    - *Business Tools:* Odoo ERP, Power BI, Tableau, Google Analytics
    - *Engineering Software:* FreeCAD, SolidWorks, CFD (ANSYS), FEA, BIM
    - *Languages:* English (Native), Spanish (B2)
  ]
]
