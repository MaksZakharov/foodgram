import React from "react";
import styles from "./styles.module.css";
import bgImage from "../../images/home-screen-bg.jpg";

const Technologies = () => {
  return (
    <div
      className={styles.pageWrapper}
      style={{ backgroundImage: `url(${bgImage})` }}
    >
      <div className={styles.card}>
        <h1 className={styles.title}>⚙️ Технологии</h1>

        <section className={styles.section}>
          <h2 className={styles.subtitle}>Стек проекта</h2>
          <ul className={styles.techList}>
            <li>⭐ Backend: Django + Djoser</li>
            <li>⭐ Frontend: React + React Router</li>
            <li>⭐ База данных: PostgreSQL</li>
            <li>⭐ Контейнеризация: Docker</li>
            <li>⭐ API-документация: ReDoc</li>
          </ul>
        </section>
      </div>
    </div>
  );
};

export default Technologies;
