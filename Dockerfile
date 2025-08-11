# שלב בנייה - מתקין את כל התלויות
FROM python:3.9 AS builder

WORKDIR /app

# מעתיק את קובץ הדרישות ומתקין את החבילות
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# מעתיק את קבצי האפליקציה
COPY static/ ./static/
COPY templates/ ./templates/
COPY app.py .
COPY dbcontext.py .
COPY person.py .


# שלב הריצה - תמונה קטנה מבוססת Alpine
FROM python:3.9-alpine

WORKDIR /app

# מעתיק את ספריות הפייתון שהותקנו בשלב הבנייה
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages

# מעתיק את קבצי האפליקציה
COPY --from=builder /app /app

# חושף את הפורט שבו האפליקציה מאזינה
EXPOSE 8080

# מגדיר את פקודת הריצה של האפליקציה
CMD ["python", "app.py"]

