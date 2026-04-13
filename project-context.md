# Project Context

## 1. Genel Proje Tanimi & Amac

**may-mobile**, MAY platformunun Flutter tabanli mobil uygulamasidir.

- **Repo:** `may-mobile`
- **Framework:** Flutter (Dart SDK ^3.6.0)
- **State Management:** Riverpod
- **Routing:** GoRouter
- **HTTP Client:** Dio
- **Auth:** JWT (Access + Refresh token)

**Kardes projeler:**
- `may-backend` — Spring Boot backend servisi
- `may-database` — PostgreSQL veritabani
- `may-flyway` — Veritabani migration

---

## 2. Mimari Kararlar & Prensipler

- **Feature-based yapi** — Her ozellik `lib/features/{feature}/` altinda (data, domain, presentation)
- **Riverpod state management** — Provider, AsyncNotifier pattern
- **GoRouter routing** — ShellRoute ile drawer navigation
- **Freezed + json_serializable** — Model code generation
- **RBAC** — Permission-based menu ve erisim kontrolu
- **Secure storage** — JWT token'lar flutter_secure_storage ile saklanir

---

## 3. Package Yapisi

```
lib/
├── app.dart                    # Router, tema, MayApp widget
├── main.dart                   # Entry point
├── core/
│   ├── constants/              # ApiConstants, AppColors, PermissionKeys
│   ├── network/                # DioClient, ApiExceptions
│   ├── storage/                # SecureStorageService
│   └── utils/                  # DateUtils, JwtUtils
├── features/
│   ├── auth/                   # Login, AuthProvider, AuthRepository
│   ├── dashboard/              # Dashboard sayfasi
│   ├── users/                  # Kullanici CRUD
│   ├── roles/                  # Rol CRUD + Rol-Yetki iliskileri
│   ├── permissions/            # Yetki CRUD
│   └── settings/               # Ayarlar sayfasi
└── shared/
    └── widgets/                # AppDrawer
```

---

## 4. Platform Ayarlari

| Platform | Package/Bundle ID |
|---|---|
| Android | `com.may.mobile` |
| iOS | `com.may.mobile` |

---

## 5. API Baglantisi

- **Base URL:** `http://localhost:8090/api/v1`
- **Backend:** `may-backend`
