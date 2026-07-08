
if ('serviceWorker' in navigator) {
  navigator.serviceWorker.getRegistrations().then((regs) => {
    regs.forEach((r) => {
      console.log('SW Desregistrado:', r);
      r.unregister();
    });
  });
}
if ('caches' in window) {
  caches.keys().then((names) => {
    names.forEach((n) => {
      console.log('Cache borrado:', n);
      caches.delete(n);
    });
  });
}

