# Use uma imagem Python estável
FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho
WORKDIR /app

# Copia o arquivo de requirements primeiro para aproveitar o cache do Docker
COPY requirements.txt .

# Instala as dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o código da aplicação
COPY . .

# Expõe a porta que a aplicação vai usar
EXPOSE 8000

# Comando para iniciar a aplicação
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]



