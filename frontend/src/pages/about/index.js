import React from "react";
import styles from "./styles.module.css";
import bgImage from "../../images/home-screen-bg.jpg";

const About = () => {
  return (
    <div
      className={styles.pageWrapper}
      style={{ backgroundImage: `url(${bgImage})` }}
    >
      <div className={styles.card}>
        <h1 className={styles.title}>👋 Добро пожаловать в Foodgram!</h1>

        <section className={styles.section}>
          <p>
            Foodgram — это онлайн-сервис для публикации и хранения рецептов.
            Здесь вы можете делиться любимыми блюдами, сохранять рецепты в
            избранное и формировать список покупок.
          </p>
          <p>
            Проект создан во время обучения в <strong>Яндекс Практикуме</strong>,
            но полностью реализован самостоятельно.
          </p>
        </section>

        <section className={styles.section}>
          <h2 className={styles.subtitle}>🔗 Ссылки</h2>
          <p>
            Код проекта:{" "}
            <a
              href="https://github.com/MaksZakharov/foodgram"
              target="_blank"
              rel="noopener noreferrer"
            >
              GitHub
            </a>
          </p>
          <p>
            Автор проекта:{" "}
            <a
              href="https://github.com/MaksZakharov"
              target="_blank"
              rel="noopener noreferrer"
            >
              Maks Zakharov
            </a>
          </p>
        </section>
      </div>
    </div>
  );
};

export default About;
