package br.eng.ivanlopes.loja;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.is;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(CarrinhoController.class)
class CarrinhoControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void deveAdicionarProdutoAoCarrinho() throws Exception {
        mockMvc.perform(post("/carrinho/produtos")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                                {
                                  "nome": "Livro",
                                  "preco": 50.0
                                }
                                """))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.quantidade", is(1)))
                .andExpect(jsonPath("$.total", is(50.0)));
    }

    @Test
    void deveRetornarTotalDoCarrinho() throws Exception {
        mockMvc.perform(get("/carrinho/total"))
                .andExpect(status().isOk());
    }
}
