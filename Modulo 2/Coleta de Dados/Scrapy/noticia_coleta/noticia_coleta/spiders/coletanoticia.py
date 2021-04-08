import scrapy
import json

class Noticia(object):
    def __init__(self,nome, resumo,data):
        self.nome = self.clean(nome)
        self.resumo =  self.clean(resumo)
        self.data =  self.clean(data)
    def clean(self,texto):
        if texto:
            return texto.replace("\n","").strip()


class ColetanoticiaSpider(scrapy.Spider):
    name = 'coletanoticia'
    allowed_domains = ['folha.uol.com.br']
    start_urls = ['https://www1.folha.uol.com.br/ultimas-noticias/']
    noticias = []
    def parse(self, response):
        for noticia_site in response.xpath('//ol[@class="u-list-unstyled"]/li'):
            nome = noticia_site.css(".c-headline__title::text").get() #Captura o Titulo da Noticia
            resumo = noticia_site.css(".c-headline__standfirst::text").get() #Captura do Resumo da Noticia
            data = noticia_site.css(".c-headline__dateline::text").get() #Captura da Data da Noticia
            noticia = Noticia(nome,resumo,data)
            print(noticia.__dict__)
            self.add(noticia)
        with open("noticias.json", "w",encoding='utf8') as file:
            json.dump([ob.__dict__ for ob in self.noticias],file,ensure_ascii=False)
            print(file)

    def add(self,noticia):
        if (noticia.nome is None or noticia.resumo is None or noticia.data is None):
            return
        self.noticias.append(noticia)